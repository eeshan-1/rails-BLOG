class PostController < ApplicationController

    # READ
    def getPost
        if params[:id]=="all"
            render json:Post.all
            return
        end
        render json:Post.find(params[:id])
    end

    def getUserForPost
        postT = Post.find(params[:id])
        render json:postT.user
    end
    
    skip_before_action :verify_authenticity_token

    # CREATE
    def postOne 
        new_post = Post.new(title:params[:title], image:params[:image], category:params[:category], content:params[:content])
        new_post.save()
        render html:"Added the post"
    end

    def postMultiple
        for m in params[:data]
            newPost = Post.new(title:m[:title], image:m[:image], category:params[:category], content:m[:content])
            newPost.save()
        end
        render html:"Added posts"
    end
 
    # UPDATE
    def editPost
        editP = Post.find(params[:id])
        Post.update_all(title:params[:title], image:params[:image], category:params[:category], content:params[:content])
        render html:"Edited Post"
    end

    # DELETE
    def deletePost 
        del = Post.find(params[:id])
        del.destroy()
        render html:"Post has been deleted"
    end

end
