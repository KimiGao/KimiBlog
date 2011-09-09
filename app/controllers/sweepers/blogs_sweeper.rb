class BlogsSweeper < ActionController::Caching::Sweeper
  observe Blog

  
end