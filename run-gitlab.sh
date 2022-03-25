#!/bin/bash

domain=$(hostname)

export GITLAB_HOME=/opt/docker/gitlab
mkdir -p $GITLAB_HOME
cd $GITLAB_HOME

cat <<EOF > $GITLAB_HOME/docker-compose.yml
web:
  container_name: 'gitlab_web'
  image: 'gitlab/gitlab-ee:latest'
  restart: always
  hostname: 'gitlab.$domain.com'
  environment:
    GITLAB_OMNIBUS_CONFIG: |
      external_url 'http://gitlab.$domain.com:8929'
      gitlab_rails['gitlab_shell_ssh_port'] = 2224
  ports:
    - '8929:8929'
    - '2224:22'
  volumes:
    - '$GITLAB_HOME/config:/etc/gitlab'
    - '$GITLAB_HOME/logs:/var/log/gitlab'
    - '$GITLAB_HOME/data:/var/opt/gitlab'
EOF
docker-compose up -d

echo "Acesse:" http://gitlab.$domain.com:8929
echo "User: root"
docker exec -it gitlab_web cat /etc/gitlab/initial_root_password | grep Password
