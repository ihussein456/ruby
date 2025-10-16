GitHub User Insights (Ruby CLI)

A simple Ruby command-line app that fetches and displays GitHub user information using the GitHub REST API.
You can view details like name, number of repositories, followers, and top starred projects.

🧰 Setup

Clone the repository

git clone <your-repo-url>
cd github_user_insights


Run the script

ruby github_insights.rb


Enter any GitHub username when prompted.

💡 Example
$ ruby github_insights.rb
🔍 GitHub User Insights (Ruby CLI)
Enter a GitHub username: torvalds

👤 Name: Linus Torvalds
📦 Public Repositories: 6
👥 Followers: 300000
🌟 Top 3 Repositories by Stars:
1. linux (⭐ 180000)
2. subsurface (⭐ 400)
3. test-tlb (⭐ 120)

✅ Data retrieved successfully!

🧠 What It Shows

How to make API requests using Ruby’s built-in net/http

How to parse JSON data

A simple example of integrating with an external REST API
