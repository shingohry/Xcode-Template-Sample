#!/bin/bash
# Xcodeでカスタムのテンプレートを利用できるようにします

XCODE_PERSONAL_TEMPLATES_DIR="$HOME/Library/Developer/Xcode/Templates/File Templates/"
PROJECT_TEMPLATES_DIR_ROOT="`pwd`/XcodeFileTemplates/"
CATEGORY_DIR="MyTemplates"

if [ ! -d "$XCODE_PERSONAL_TEMPLATES_DIR" ] ; then
  echo "Xcodeの個人テンプレートディレクトリがなければ作成"
  echo "$XCODE_PERSONAL_TEMPLATES_DIR"
  mkdir -p "$XCODE_PERSONAL_TEMPLATES_DIR"
fi

echo "個人テンプレートディレクトリからプロジェクトのカスタムテンプレートへのシンボリックリンクがなければ作成"
SOURCE_DIR=$PROJECT_TEMPLATES_DIR_ROOT$CATEGORY_DIR
TARGET_DIR=$XCODE_PERSONAL_TEMPLATES_DIR$CATEGORY_DIR

echo "$SOURCE_DIR"
if [ ! -L "$TARGET_DIR" ]; then
  ln -sf "$SOURCE_DIR" "$TARGET_DIR"
fi
