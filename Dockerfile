# 使用官方的 Python 基础镜像
FROM python:3.11-slim

# 设置维护者信息
# LABEL maintainer=""

# 设置环境变量，避免生成 pyc 文件
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# 更新基础镜像并安装必要的依赖
RUN apt-get update && \
apt-get install -y --no-install-recommends \
sshpass \
openssh-client \
git \
curl && \
apt-get clean && \
rm -rf /var/lib/apt/lists/*

# 安装 Ansible
RUN pip install --no-cache-dir ansible

# 创建工作目录
WORKDIR /ansible

# 将你的 Ansible 配置文件和 Playbook 复制到镜像中
COPY ./ansible /ansible

# 设置默认的命令
CMD ["ansible-playbook", "--version"]
