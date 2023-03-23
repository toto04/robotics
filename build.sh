docker buildx build \
  --platform linux/arm64,linux/amd64 \
  -t toto04/robotics:latest \
  --push -f Dockerfile .