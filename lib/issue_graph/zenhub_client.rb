require 'issue_graph/connection'
require 'issue_graph/github'
require 'issue_graph/version'

module IssueGraph
  class ZenhubClient
    include Connection

    attr_reader :zenhub_access_token, :github

    def epics(repo_name)
      get "/p1/repositories/#{github.repo_id(repo_name)}/epics/"
    end

    def epic_data(repo_name, epic_id)
      get "/p1/repositories/#{github.repo_id(repo_name)}/epics/#{epic_id}"
    end

    def issue_data(repo_name, issue_number)
      get "/p1/repositories/#{github.repo_id(repo_name)}/issues/#{issue_number}"
    end

    def issue_events(repo_name, issue_number)
      get "/p1/repositories/#{github.repo_id(repo_name)}/issues/#{issue_number}/events"
    end

    def board_data(repo_name)
      get "/p1/repositories/#{github.repo_id(repo_name)}/board"
    end

    def dependencies(repo_name)
      get "/p1/repositories/#{github.repo_id(repo_name)}/dependencies"
    end

    def initialize(zenhub_access_token, github_access_token)
      @zenhub_access_token = zenhub_access_token
      @github = IssueGraph::Github.new(github_access_token)
    end
  end
end
