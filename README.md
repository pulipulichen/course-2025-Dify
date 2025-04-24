# practice-Dify-202502


# Get API Keys

- Google Gemini: https://ai.google.dev/
- Hugging Faces: https://huggingface.co/settings/tokens
 * 模型名稱: intfloat/multilingual-e5-large
- SerpApi: https://serpapi.com/manage-api-key

幫助你記錄API的表格：https://docs.google.com/spreadsheets/d/1HTPuHtikfqDeBprZHjWWBqLxnQgn0qfb/copy

----

## Prompt related to the library

````
請問閉架書庫在哪裡？
````

## Casual prompt

````
你覺得圖書館員是不是過得太閒了？
````

----

## 如何更新Dify

1. 到Dify的Repo找到最新的Release壓縮檔。

https://github.com/langgenius/dify/releases

只要zip壓縮檔就好，不要用 `git clone`，因為我們不是用Dify保存庫的架構。

2. 解壓縮後，找到 ./docker/.env.example ，複製成 ./docker/.env ，此為新版 .env

3. 跟此repo裡面的 ./dify/docker/.env (此為舊版.env) 比較，把有差異的地方更新到新版 .env

- ./dify/docker/.env (舊版.env) 的檔案就是 https://github.com/pulipulichen/practice-Dify-202502/blob/main/dify/docker/.env
- 有差異的地方需要同步記錄在 ./default.env ： https://github.com/pulipulichen/practice-Dify-202502/blob/main/default.env
- 比較工具： https://github.com/pulipulichen/practice-Dify-202502/blob/main/default.env

4. 把此repo的舊版dify目錄整個刪掉，把新版dify目錄 (包含新版.env)移動到此，目錄名稱一樣是 dify

5. 嘗試 `docker compose up --build` ，然後開啟 `http://localhost:18080` ，必須要能順利開啟 Dify。否則觀察錯誤訊息來修正。

6. 完成後git推上去。 `git commit -a -m "Update Dify" && git push`

----

## 如何更新dify-for-arm

1. 複製 ./dify/docker/docker-compose.yml 到 ./dify-for-arm/docker/docker-compose.yml

2. 把image的版本拿掉。例如「image: langgenius/dify-api:0.15.3」改成「image: langgenius/dify-api」

3. 用ARM CPU的電腦跑跑看。

4. 完成後git推上去。 `git commit -a -m "Update dify-for-arm" && git push`
