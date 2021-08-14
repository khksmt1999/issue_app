class IssuesController < ApplicationController
  def index
		@issues = Issue.all
  end

  def show
		@issue = Issue.find(params[:id])
  end

  def new
    @issue = Issue.new
  end

  def create
    issue = Issue.new(issue_params)
    issue.save!
    redirect_to issues_url, notice: "意見「#{issue.title}」を登録しました。"
  end

  def edit
		@issue = Issue.find(params[:id])
  end

	def update
		issue = Issue.find(params[:id])
		issue.update!(issue_params)
		redirect_to issues_url, notice: "意見「#{issue.title}」を更新しました。"
	end

	def destroy
		issue = Issue.find(params[:id])
		issue.destroy
		redirect_to issues_url, notice: "意見「#{issue.title}」を削除しました。"
	end

	private

	def issue_params
		params.require(:issue).permit(:title, :description)
	end
end
