require 'pry'
require 'colorize'

class Blog
  attr_reader :posts
  def initialize(posts = [])
    @posts = posts
  end

  def add_post(post)
    @posts.push(post)
  end

  def publish_front_page
    sorted = @posts.sort {|a,b| b.date <=>a.date}
    splited_arr = sorted.each_slice(3).to_a
    page = 0
    get_page(page, splited_arr)
  end

  def get_page(page, arr_of_orr)
    pages = arr_of_orr.length
    print_sub_arr(arr_of_orr[page])

    for i in 0...pages
      if i == page
        print "#{i+1}".colorize(:blue)
      else
        print "#{i+1}"
      end
      print " "
    end

    puts "\n"
    puts "Got to: (next/prev)"
    go_to = gets.chomp
    
    if go_to.downcase == "next" && page < (pages - 1)
      page += 1
      get_page(page, arr_of_orr)
    elsif go_to.downcase == "prev" && page < pages && page > 0
      page -= 1
      get_page(page, arr_of_orr)
    else
      puts "Hooray you read all my posts!!"
    end  
  end

  def print_sub_arr(arr)
    arr.each { |post|  
      if post.class == SponsoredPost
        title = "******#{post.title}******\n   *******   \n"
      else
        title = "#{post.title}\n   *******   \n"
      end
      puts title += "#{post.content}\n-------------\n"
    }
  end
end

class Post
  attr_reader :date, :content, :title
  def initialize(title,content)
    @title = title
    @content = content
    @date = Time.new
  end
end

class SponsoredPost < Post  
end

#Some diferent ways to add posts:
post1 = Post.new("title1", "conent1")
post2 = Post.new("title2", "conent2")
post3 = Post.new("title3", "conent3")
post4 = Post.new("title4", "conent4")
post5 = Post.new("title5", "conent5")
post6 = Post.new("title6", "conent6")
sponsoredPost = SponsoredPost.new("title sponsored", "content sponsored")

blog = Blog.new([post1, post2, post3, post4, post5, post6])

post7 = Post.new("title7", "conent7")
blog.add_post(post4)
blog.add_post(sponsoredPost)

blog.publish_front_page
