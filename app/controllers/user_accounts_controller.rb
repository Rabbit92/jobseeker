class UserAccountsController < ApplicationController
  before_action :set_user_account, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    if current_user.is_admin?
      @user_accounts = UserAccount.all
      respond_with(@user_accounts)
    else
      redirect_to user_account_url(current_user.user_account.id)
    end
  end

  def show
    respond_with(@user_account)
  end

  def new
    @user_account = UserAccount.new
    respond_with(@user_account)
  end

  def edit
  end

  def create
    @user_account = UserAccount.new(user_account_params)
    @user_account.user = current_user
    @user_account.save
    respond_with(@user_account)
  end

  def update
    @user_account.update(user_account_params)
    respond_with(@user_account)
  end

  def destroy
    @user_account.destroy
    respond_with(@user_account)
  end

  private
    def set_user_account
      @user_account = UserAccount.find(params[:id])
    end

    def user_account_params
      params.require(:user_account).permit(:prenume, :nume, :data_nasterii)
    end
end
