# Dart ORM(Prisma Client Dart) Docker Example

这是一个最小可用的 dart [orm 库](https://github.com/medz/prisma-dart) 打包为 Docker 镜像的示例。

只需要在 Dart Server 打包的基础上，生成或添加下列文件即可。具体可看 [Dockerfile](./Dockerfile) 。

- Prisma Query Engine
- Prisma 的运行时依赖：libz.so, libgcc_s.so, libssl.so, libcrypto.so

最终的打包镜像文件应该只有 34M 左右。

> 感谢 [Seven Du](https://github.com/medz) 提供的帮助！

<details>

<summary> click to show English version </summary>

This is an example of the minimum available dart [orm library](https://github.com/medz/prisma-dart) packaged as a Docker image.

Simply generate or add the following files to the Dart Server package. See [Dockerfile](. /Dockerfile).

- Prisma Query Engine
- Prisma's runtime dependencies: libz.so, libgcc_s.so, libssl.so, libcrypto.so

The final packaged image should be about 34M.

> Thanks to [Seven Du](https://github.com/medz) for the help!

</details>

## Ref

[Prisma Client Dart (orm package) Doc](https://prisma.pub/getting-started/)

---

dart server 🩵