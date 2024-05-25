# another-budget-tracker
Practicing C#

1. From `/workspaces/another-budget-tracker`, run `wget -q https://raw.githubusercontent.com/dapr/cli/master/install/install.sh -O - | /bin/bash && dapr init && export PATH=$PATH:/home/vscode/.dapr/bin && dotnet dev-certs https --trust`
2. From `./src/Server`, run `dapr run --app-id myserver --app-port 5000`