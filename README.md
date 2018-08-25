# Build

```
docker build -t tf-test .
```

# Run

```
docker run -it -p 8888:8888 -v $(pwd)/notebooks:/notebooks tf-test
```
