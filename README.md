# another-budget-tracker
Practicing C#

1. From `/workspaces/another-budget-tracker`, run `./utilities/setup-dotnet-projects.sh && wget -q https://raw.githubusercontent.com/dapr/cli/master/install/install.sh -O - | /bin/bash && dapr init && export PATH=$PATH:/home/vscode/.dapr/bin && dotnet dev-certs https --trust`
2. From `./src/Client`, run `dotnet run`
3. Start a new bash instance, from `./src/Server`, run `dapr run -- dotnet run` (open VSCode recommended endpoint in browser, suffix with `/weatherforecast`)
