class SearchController < ApplicationController
  def search
    @model = params["search"]["model"]
    @how = params["search"]["how"]
    @content = params["search"]["content"]
    @datas = search_for(@model, @how, @content)
  end

  private
  def match(model, content)
    if model == 'user'
      User.where(name: content)
    elsif model == 'book'
      Book.where(title: content)
    end
  end
  def forward(model, content)
    if model == 'user'
      User.where("name LIKE?", "#{content}%")
    elsif model == 'book'
      Book.where("title LIKE?", "#{content}%")
    end
  end
  def backward(model, content)
    if model == 'user'
      User.where("name lIKE?", "%#{content}")
    elsif model == 'book'
      Book.where("title LIKE?", "%#{content}")
    end
  end
  def partial(model, content)
    if model == 'user'
      User.where("name LIKE?", "%#{content}%")
    elsif model == 'book'
      Book.where("title LIKE?", "%#{content}%")
    end
  end
  def search_for(model, how, content)
    case how
      when 'match'
        match(model, content)
      when 'forward'
        forward(model, content)
      when 'backward'
        backward(model, content)
      when 'partial'
        partial(model, content)
    end
  end
end
