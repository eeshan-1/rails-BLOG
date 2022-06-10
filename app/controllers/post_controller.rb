class PostController < ApplicationController

    # READ
    def getPost
        if params[:id]=="all"

            # for concatenating user data associated with a post
            posts = Post.all 
            p = []
            for i in posts do
                # puts(i.user_id)
                u = i.attributes
                u["user"] = User.find(i.user_id)
                p.push(u)
                # p.push(i)
            end
            render json:p

            #render json:Post.all
            return
        end
        
        # p = []
        i = Post.find(params[:id])
        u = i.attributes
        u["user"] = User.find(i.user_id)
        # p.push(u)
        render json:u

        # render json:Post.find(params[:id])
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

    def addPost
        authorId = User.find_by(name:params[:name])
        newPost = Post.create(title:params[:title],image:params[:image],category:params[:category],content:params[:content],user:authorId)
        render json: newPost    
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
