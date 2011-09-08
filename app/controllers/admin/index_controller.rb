class Admin::IndexController < ApplicationController
  before_filter :user_authorize,:except => [:login,:validate_user]

  def logout
    reset_session
    redirect_to "/admin/login"
  end

  def validate_user
    begin
      admin = Admin.validate_user params[:login_name],params[:login_pwd]
      if admin == nil
        info = '用户名或密码错误'
      else
        session[:admin_id] = admin.id
        info = 'success'
      end
    rescue Exception => e
      logger.info e
      info = '服务器错误，重新登录'
    end

    render :text => get_result(info),:layout => false
  end
  
  def index
    @menus = @@menus_map[1].to_json
  end

  private

  @@menus_map = {
    1 => [
      # === 博客管理 ===
      { :id => 1, :name => '博客管理', :image => '/images/icons/plugin.gif',
        :url => 'blogs', :qtip => '博客管理', :leaf => false,
        :children => [
          # --- 博客列表 ---
          { :id => 10, :name => '博客列表', :image => '/images/icons/plugin.gif',
            :url => '/admin/blogs', :qtip => '博客列表', :leaf => true
          },
          { :id => 11, :name => '标签列表', :image => '/images/icons/plugin.gif',
            :url => '/admin/blogs/tags_list', :qtip => '标签列表', :leaf => true
          }
        ]
      },
      # === 留言板 ===
      { :id => 2, :name => '留言板', :image => '/images/icons/plugin.gif',
        :url => 'messages', :qtip => '留言板', :leaf => false,
        :children => [
          # --- 用户管理 ---
          { :id => 20, :name => '留言列表', :image => '/images/icons/plugin.gif',
            :url => '/admin/messages', :qtip => '留言列表', :leaf => true
          }
        ]
      },
      # === 招聘 ===
      { :id => 2, :name => '应聘', :image => '/images/icons/plugin.gif',
        :url => 'messages', :qtip => '应聘', :leaf => false,
        :children => [
          # --- 用户管理 ---
          { :id => 20, :name => '应聘列表', :image => '/images/icons/plugin.gif',
            :url => '/admin/job', :qtip => '应聘列表', :leaf => true
          }
        ]
      },
      # === 后台管理 ===
      { :id => 3, :name => '后台管理', :image => '/images/icons/plugin.gif',
        :url => 'admins', :qtip => '后台管理', :leaf => false,
        :children => [
          # --- 用户管理 ---
          { :id => 30, :name => '用户管理', :image => '/images/icons/plugin.gif',
            :url => '/admin/admins', :qtip => '用户管理', :leaf => true
          }
        ]
      }

    ]
  }
end
