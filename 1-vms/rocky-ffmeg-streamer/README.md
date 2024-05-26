# ffmpeg rtsp streamer

```sh
ffmpeg -f alsa -channels 2 -sample_rate 44100 -i default:CARD=CODEC -ac 2 -c:a aac -q:a 2 -f rtsp rtsp://mediamtx:8554/stream
```