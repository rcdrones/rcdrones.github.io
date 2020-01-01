set http_proxy=127.0.0.1:1080

set https_proxy=127.0.0.1:1080

setx "http_proxy" "127.0.0.1:1080"

setx "https_proxy" "127.0.0.1:1080"


git add .

git commit -m "update blog"

git push
