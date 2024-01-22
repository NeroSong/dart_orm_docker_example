# Dart ORM Docker Example

这是一个最小可用的 dart [orm 库](https://github.com/medz/prisma-dart) 打包为 Docker 镜像的示例。

如果只是在 dart 打包的基础上，复制 prisma-query-engine 到 scratch 中，运行时会产生 `Prisma binary query engine not ready` 异常。

经过大量查阅和尝试，发现一些可能导致问题的地方：

- 虽然只用到了 prisma-query-engine 这个二进制文件，但其内部依然需要 npm 环境。
- 安装和初始化 prisma ，下载查询引擎时，需要和最终打包的镜像在同一个系统和架构之下。
- 如果基础镜像没有 openssh，手动安装时要在官网查询引擎对应的版本号。

通过调整复制的文件和基础镜像，最后实现的最小打包镜像为 100M ✨ 

考虑到各种必须的依赖，我暂时认为应该很难再缩小了。如果你能让它变得更小，欢迎提交 issue 或 PR！


<details>

<summary> click to show English version </summary>

This is an example of a minimally available usage of dart [orm package](https://github.com/medz/prisma-dart) as a Docker image.

If you just copy prisma-query-engine into scratch, it will throw a `Prisma binary query engine not ready` exception when running.

After a lot of research and experimentation, I found a few things that might be causing the problem:

- Although only the prisma-query-engine binary is used, it still requires the npm environment internally.
- When installing and initializing prisma and downloading the query engine, it needs to be on the same system and architecture as the final packaged image.
- If the base image does not have openssh, you will need to look up the version number of the engine on the doc website when installing it manually.

By adjusting the replicated files and the base image, the final minimum packaged image is 100M ✨ 

Considering the various mandatory dependencies, I tentatively think it should be hard to shrink it any further. If you can make it smaller, feel free to submit an issue or PR!

</details>

## Ref

[Prisma Client Dart (orm package) Doc](https://prisma.pub/getting-started/)

[Prisma Doc](https://www.prisma.io/docs/orm)


---

dart server 🩵