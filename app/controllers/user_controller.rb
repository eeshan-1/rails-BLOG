class UserController < ApplicationController
    
    # READ
    def getUser
        if params[:id]=="all"
            render json:User.all
            return
        end
        render json:User.find(params[:id])  
    end

    def getPostsOfUser
        userT = User.find(params[:id])
        render json:userT.posts
    end

    skip_before_action :verify_authenticity_token

    # CREATE
    def postOne 
        new_user = User.new(name:params[:name], avatar:params[:avatar], about:params[:about], email:params[:email], password:params[:password])
        new_user.save()
        render html:"Added the user"
    end

    def postMultiple
        for m in params[:data]
            new_user = User.new(name:params[:name], avatar:params[:avatar], about:params[:about], email:params[:email], password:params[:password])
            new_user.save()
        end
        render html:"Added users"
    end


    # DELETE
    def deleteUser 
        del = User.find(params[:id])
        del.destroy()
        render html:"User has been deleted"
    end
end
