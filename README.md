# THINGS IN HERE

## GEMS

```
gem "sassc-rails"
gem 'pygments.rb'
gem 'redcarpet'
gem 'friendly_id'
gem 'will_paginate'
gem 'mail_form'
gem 'devise'
```

- used friendly id's
- i couldnt use pygments/redcarpet because i didnt have python3 installed
- sass rails for .scss files
- devise set for turbo, rails 7
- from: https://dev.to/efocoder/how-to-use-devise-with-turbo-in-rails-7-9n9
- will paginate worked and styled
- I didnt test the mail_form

## MODELS
- devise user
- posts with friendly id
- projects with friendly id
- contact (for mail form)

## OTHER
- he did his own styling
- did a _master.scss for the main variables and imported it to the other scss files
- he added a route for when the page doesn't exist

```
get '*path' => redirect('/')
```

- used disqus for the comments on the posts
- share box for twitter, facebook, google

```
  <div id="share_box">
    <p>Share The DO List</p>
    <!-- Twitter -->
    <a onclick="javascript:window.open('http://twitter.com/share?text=<%= @post.title %> by @mackenziechild - &amp;url=<%= url_for([@post, {only_path: false}]) %>', '_blank', 'width=800, height=500, top=200, left=300');void(0);"><i class="fa fa-twitter"></i></a>
    <!-- Facebook -->
    <a onclick="javascript:window.open('http://www.facebook.com/sharer.php?u=<%= url_for([@post, {only_path: false}]) %>', '_blank', 'width=800, height=500, top=200, left=300');void(0);"><i class="fa fa-facebook"></i></a>
    <!-- Google Plus -->
    <a onclick="javascript:window.open('https://plus.google.com/share?url=<%= url_for([@post, {only_path: false}]) %>', '_blank', 'width=800, height=500, top=200, left=300');void(0);"><i class="fa fa-google-plus"></i></a>
  </div>
```

## Contact form
- rails generate mail_form Contact
- added the routes manually

```
resources :contacts, only: [:new, :create]
```

- copied over the views/contacts
- added the controller
- update the contact.rb

```
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,   :validate => true
  attribute :nickname,  :captcha  => true

  def headers
    {
      :subject => "Contact Form",
      :to => "mackenzie@unicasts.com",
      :from => %("#{name}" <#{email}>)
    }
  end
```

- I set it up but i dont know if its fully working
