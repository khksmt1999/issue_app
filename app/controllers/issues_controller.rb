class IssuesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
		@issues = Issue.all
  end

  def show
		@issue = Issue.find(params[:id])
		user_id = @issue.user_id
		@user = User.find(user_id)
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = current_user.issues.new(issue_params)

    if @issue.save
    	redirect_to @issue, notice: "意見「#{@issue.title}」を登録しました。"
		else
			render :new
		end
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
