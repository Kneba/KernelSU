#!/bin/env bash

msg="*$TITLE*
\\#ci\\_$VERSION
\`\`\`
$COMMIT_MESSAGE
\`\`\`
[Commit]($COMMIT_URL)
[Workflow run]($RUN_URL)
"

BOT_BUILD_URL="https://api.telegram.org/bot$BOT_TOKEN/sendDocument"

file="$1"

curl -F document=@$file "$BOT_BUILD_URL" \
	 -F chat_id="$CHAT_ID" \
	 -F "disable_web_page_preview=true" \
	 -F "parse_mode=markdownv2" \
	 -F caption="$msg"
