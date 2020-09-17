# Xfce4 XRDP image

[Based on Alpin Xfce4 xrdp](https://github.com/danielguerra69/alpine-xfce4-xrdp) and added a few programs (Chromium and more...)

Launch: ```docker run -p 3390:3389 --rm --name xfce4-xrdp nyvanga/xfce4-xrdp```

And then connect with Remote Desktop Client to localhost:3390

## Test build

Run: ```docker-compose up --build```