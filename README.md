# Build the Docker Image

```
sudo ./build-docker.sh
```

# Run agy

```
./agy-sandbox.sh
```

# Clipboard support (optional)

To enable clipboard support, add the following command to your `~/.xprofile`:


```
xhost +local:docker > /dev/null 2>&1
```

# Deployment (optional)

Copy the script to a directory in your `PATH`:
```
cp agy-sandbox.sh ~/bin/agy
```

Or create an alias:
```
alias agy='/path/to/agy-sandbox.sh'
```

Once set up, you can run it using `agy`
