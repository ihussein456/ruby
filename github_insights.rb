#!/usr/bin/env ruby
require 'net/http'
require 'json'
require 'uri'

# Simple helper to make GET requests
def fetch_json(url)
  uri = URI(url)
  response = Net::HTTP.get_response(uri)

  unless response.is_a?(Net::HTTPSuccess)
    puts "❌ Error: #{response.code} - #{response.message}"
    exit
  end

  JSON.parse(response.body)
end

def fetch_user_data(username)
  fetch_json("https://api.github.com/users/#{username}")
end

def fetch_user_repos(username)
  fetch_json("https://api.github.com/users/#{username}/repos")
end

def display_user_info(user)
  puts "\n👤 Name: #{user['name'] || 'N/A'}"
  puts "🏠 Location: #{user['location'] || 'N/A'}"
  puts "📦 Public Repositories: #{user['public_repos']}"
  puts "👥 Followers: #{user['followers']}"
  puts "🔗 Profile: #{user['html_url']}"
end

def display_top_repos(repos)
  return puts "No repositories found." if repos.empty?

  sorted = repos.sort_by { |r| -r['stargazers_count'] }.take(3)
  puts "\n🌟 Top 3 Repositories by Stars:"
  sorted.each_with_index do |repo, i|
    puts "#{i + 1}. #{repo['name']} (⭐ #{repo['stargazers_count']})"
    puts "   #{repo['html_url']}"
  end
end

puts "🔍 GitHub User Insights (Ruby CLI)"
print "Enter a GitHub username: "
username = gets.chomp.strip

if username.empty?
  puts "⚠️  Please enter a valid username."
  exit
end

puts "\nFetching data for '#{username}'..."
user = fetch_user_data(username)
repos = fetch_user_repos(username)

display_user_info(user)
display_top_repos(repos)

puts "\n✅ Data retrieved successfully!"
