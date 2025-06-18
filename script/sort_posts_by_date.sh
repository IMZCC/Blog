#!/bin/bash

# 脚本：按照文章内容中的date字段对文件进行排序并重命名
# 将content/posts目录下的文件按date排序后在文件名前加序号

POSTS_DIR="content/posts"
TEMP_FILE="/tmp/sort_posts_temp.txt"

# 检查目录是否存在
if [ ! -d "$POSTS_DIR" ]; then
    echo "错误：目录 $POSTS_DIR 不存在"
    exit 1
fi

# 创建临时文件存储文件名和日期
> "$TEMP_FILE"

echo "正在提取文件日期信息..."

# 遍历所有markdown文件
for file in "$POSTS_DIR"/*.md; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        
        # 跳过国际化文件（.en.md, .fr.md等），只处理基础文件
        if [[ "$filename" =~ \.[a-z]{2}\.md$ ]]; then
            echo "跳过国际化文件：$filename"
            continue
        fi
        
        # 提取date字段
        date_line=$(grep "^date:" "$file" | head -1)
        if [ -n "$date_line" ]; then
            # 提取日期部分（去掉date:前缀和时区信息）
            date_value=$(echo "$date_line" | sed 's/^date: //' | sed 's/T.*$//')
            echo "$date_value|$filename" >> "$TEMP_FILE"
        else
            echo "警告：文件 $filename 未找到date字段"
        fi
    fi
done

# 按日期排序
echo "正在按日期排序..."
sort "$TEMP_FILE" -o "$TEMP_FILE"

# 重命名文件
echo "正在重命名文件..."
counter=1

# 首先移除所有已有的序号前缀（如果存在）
echo "清理现有序号..."
cd "$POSTS_DIR"
for file in *.md; do
    if [[ "$file" =~ ^[0-9]+\..* ]]; then
        # 移除数字前缀
        new_name=$(echo "$file" | sed 's/^[0-9]*\.//')
        if [ "$file" != "$new_name" ]; then
            mv "$file" "$new_name"
            echo "清理：$file -> $new_name"
        fi
    fi
done

cd - > /dev/null

# 按排序后的顺序重命名文件并添加slug
while IFS='|' read -r date filename; do
    old_path="$POSTS_DIR/$filename"
    new_filename="${counter}.$filename"
    new_path="$POSTS_DIR/$new_filename"
    
    if [ -f "$old_path" ]; then
        # 获取原文件名（不包含.md后缀）作为slug
        slug_name="${filename%.md}"
        
        # 先移动基础文件
        mv "$old_path" "$new_path"
        
        # 检查并处理国际化文件
        base_name="${filename%.md}"
        for i18n_file in "$POSTS_DIR"/$base_name.*.md; do
            if [ -f "$i18n_file" ]; then
                i18n_filename=$(basename "$i18n_file")
                # 提取语言代码 (如 .en.md)
                lang_suffix="${i18n_filename#$base_name}"
                new_i18n_filename="${counter}.$base_name$lang_suffix"
                new_i18n_path="$POSTS_DIR/$new_i18n_filename"
                
                mv "$i18n_file" "$new_i18n_path"
                
                # 为国际化文件添加slug字段
                if ! grep -q "^slug:" "$new_i18n_path"; then
                    sed -i '' "/^date:/a\\
slug: $slug_name\\
" "$new_i18n_path"
                    echo "    国际化文件：$i18n_filename -> $new_i18n_filename (添加了 slug: $slug_name)"
                else
                    echo "    国际化文件：$i18n_filename -> $new_i18n_filename (已存在slug字段)"
                fi
            fi
        done
        
        # 检查基础文件是否已经有slug字段
        if ! grep -q "^slug:" "$new_path"; then
            # 在frontmatter中添加slug字段
            # 在date行后面插入slug字段
            sed -i '' "/^date:/a\\
slug: $slug_name\\
" "$new_path"
            echo "$counter. $date - $filename -> $new_filename (添加了 slug: $slug_name)"
        else
            echo "$counter. $date - $filename -> $new_filename (已存在slug字段)"
        fi
        
        ((counter++))
    fi
done < "$TEMP_FILE"

# 清理临时文件
rm "$TEMP_FILE"

echo "完成！共处理了 $((counter-1)) 个文件。"
echo "文件已按日期从早到晚排序并重命名。"