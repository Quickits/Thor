# Thor

🔨 Thor is a executable binary FFmpeg for Android (with libmp3lame)

| Build Tools   | version                   |
| ------------- | ------------------------- |
| ndk           | 17.1.4828580              |
| ndk-platform  | android-19                |
| ndk-toolchain | arm-linux-androideabi-4.9 |
| FFmpeg        | 3.2.4                     |
| libmp3lame    | 3.100                     |

## Compile

- Set environment variable

  ```bash
  export NDK_ROOT={your ndk path}
  ```

- Initialization projects

  ```bash
  ./init_project.sh
  ```

- Build

  ```bash
  ./build.sh
  ```

# License

Apache License Version 2.0

Copyright (c) 2018-present, GavinLiu
