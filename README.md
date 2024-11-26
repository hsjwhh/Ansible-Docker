ansible 的 docker 镜像文件

目录结构
```
ansible/

├── playbooks/ # 存放所有的 Ansible Playbook 文件
│  ├── site.yml # 主 Playbook 文件
│  ├── webservers.yml # 示例子 Playbook
│  └── tasks/ # 存放子任务文件
│  └── common.yml
├── inventory/ # 存放 inventory 文件
│  ├── hosts  # 主机清单
│  └── group_vars/  # 按组定义变量
│  └── webservers.yml
├── keys/  # 存放服务器密钥
│  ├── server1.key
│  ├── server2.key
│  └── README.md  # 描述密钥用途（建议，不包含敏感信息）
├── roles/ # 按角色管理 Playbook
│  ├── webserver/
│  │  ├── tasks/
│  │  ├── handlers/
│  │  ├── templates/
│  │  ├── files/
│  │  ├── vars/
│  │  └── defaults/
│  └── database/
├── ansible.cfg  # Ansible 配置文件
└── README.md  # 项目说明
```

各目录作用

1. playbooks/
• 用于存放主 Playbook 和按功能划分的子任务。
• 例：site.yml 是入口文件，可包含多个角色的调用。

2. inventory/
• hosts 文件存储主机清单，定义目标服务器。
• group_vars/ 中存储组变量，按组配置共享参数。
• 例：webservers.yml 定义 webservers 组相关变量。

3. keys/
• 存放 SSH 密钥，用于连接目标服务器。
• 将密钥通过挂载方式绑定到容器内（避免硬编码）。
• 示例：server1.key 对应特定目标服务器的 SSH 密钥。

4. roles/
• 按角色划分任务，便于复用和扩展。
• 每个角色下可有：
• tasks/: 存放具体任务。
• handlers/: 定义触发器。
• templates/: 存放模板文件。
• files/: 存放静态文件。
• vars/: 角色专用变量。
• defaults/: 角色的默认变量。

5. ansible.cfg
• 配置 Ansible 的行为，如默认 inventory 文件位置、密钥路径等。