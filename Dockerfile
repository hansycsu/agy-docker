FROM ubuntu:24.04

# 安裝基礎工具與憑證
RUN apt-get update && apt-get install -y \
    curl \
    git \
    ca-certificates \
    sudo \
    vim-gtk3 \
    xclip \
    ripgrep \
    && rm -rf /var/lib/apt/lists/*

# 賦予內建的 ubuntu (UID 1000) 免密碼 sudo 權限
RUN echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ubuntu
WORKDIR /home/ubuntu

# 建立 .vim 並設定擁有者為 ubuntu
ADD --chown=ubuntu:ubuntu vim.tar.gz /home/ubuntu/

# 執行官方提供的 agy 安裝指令
RUN curl -fsSL https://antigravity.google/cli/install.sh | bash

ENV PATH="/home/ubuntu/.local/bin:${PATH}"

# ----------------------------------------------------------------------
# 臨時測試用新增套件區 (放後面不破壞 Cache, build 比較快)
# ----------------------------------------------------------------------
# RUN sudo apt-get update && sudo apt-get install -y \
#     <new-package> \
#     && sudo rm -rf /var/lib/apt/lists/*
# ----------------------------------------------------------------------

WORKDIR /workspace
