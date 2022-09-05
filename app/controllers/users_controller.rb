class UsersController < ApplicationController
    def index
      @users = User.all #allメソッドはusersテーブルのレコードを全て取得できるメソッド
      @posts = Post.all #postsテーブルの全データを取得する
    
    end
   
  
   def new
      @user = User.new
    end
  
    def create
      @user = User.new(params.require(:user).permit(:name, :email, :age, :introduction))
      #以下のsaveメソッドで保存がされません
      if @user.save
        flash[:notice] = "ユーザーを新規登録しました"
        redirect_to :users
      else
        #こちらの処理が実行されます。
        render "new"
      end
    end
    
    def show
      @user = User.find(params[:id])
      @post = Post.new
      @posts = Post.where(user_id: @user.id) #この記述でも実装できる

    end
  
  
    def edit
      @user = User.find(params[:id])
    end
  
  
    def update
      @user = User.find(params[:id])
      if @user.update(params.require(:user).permit(:name, :email, :age, :introduction))
        flash[:notice] = "ユーザーIDが「#{@user.id}」の情報を更新しました"
        redirect_to :users
      else
        render "edit"
      end
    end
  
    def destroy
      @user = User.find(params[:id])
      @user.destroy
      flash[:notice] = "ユーザーを削除しました"
      redirect_to :users
    end
  
  end
  
  