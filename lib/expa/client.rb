module EXPA
  class Client

    def initialize
      @url = 'https://auth.aiesec.org/users/sign_in'
      @url_op = 'https://aiesec.org/auth'
      @token = nil
      @max_age = nil
      @expiration_time = nil
      @password = nil
    end

    def auth(email, password)
      @email = email
      @password = password
      agent = Mechanize.new {|a| a.ssl_version, a.verify_mode = 'TLSv1',OpenSSL::SSL::VERIFY_NONE}
      page = agent.get(@url)
      aiesec_form = page.form()
      aiesec_form.field_with(:name => 'user[email]').value = @email
      aiesec_form.field_with(:name => 'user[password]').value = @password

      begin
        page = agent.submit(aiesec_form, aiesec_form.buttons.first)
      rescue => exception
        puts exception.to_s
        false
      else
        if page.code.to_i == 200
          cj = page.mech.agent.cookie_jar.store
          index = cj.count
          for i in 0...index
            index = i if cj.to_a[i].domain == 'aiesec.org'
          end
          if index != cj.count
            params = cj.to_a[index].value
            data = JSON.parse(URI.decode(params))
            @token = data["token"]["access_token"]
            @expiration_time = cj.to_a[index].created_at
            @max_age = data["token"]["max_age"]
            true
          end
        end
      end
    end

    def login(email, password)
      agent = Mechanize.new {|a| a.ssl_version, a.verify_mode = 'TLSv1',OpenSSL::SSL::VERIFY_NONE}
      page = agent.get(@url)
      aiesec_form = page.form()
      puts aiesec_form.texts
      aiesec_form.field_with(:name => 'user[email]').value = email
      aiesec_form.field_with(:name => 'user[password]').value = password

      begin
        page = agent.submit(aiesec_form, aiesec_form.buttons.first)
        puts aiesec_form.buttons.first
        puts page.content
        puts page.code.to_i
      rescue => exception
        puts exception.to_s
        false
      else
        if page.code.to_i == 200
          cj = page.mech.agent.cookie_jar.store
          index = cj.count
          for i in 0...index
            index = i if cj.to_a[i].domain == 'experience.aiesec.org'
            puts i
          end
          if index != cj.count
            token = cj.to_a[index].value
            expiration_time = cj.to_a[index].created_at
            max_age = cj.to_a[index].max_age
            puts 'token: '+token.to_s
            puts 'expiration_time: '+expiration_time.to_s
            puts 'max_age: '+max_age.to_s
          end
        end
      end
      {token:token,expiration_time:expiration_time,max_age:max_age}
    end

    def login_opportunities(email, password)
      agent = Mechanize.new {|a| a.ssl_version, a.verify_mode = 'TLSv1',OpenSSL::SSL::VERIFY_NONE}
      page = agent.get(@url_op)
      aiesec_form = page.forms[0]
      puts aiesec_form.texts
      aiesec_form.field_with(:name => 'user[email]').value = email
      aiesec_form.field_with(:name => 'user[password]').value = password

      begin
        page = agent.submit(aiesec_form, aiesec_form.buttons.first)
        puts aiesec_form.buttons.first
        puts page.content
        puts page.code.to_i
      rescue => exception
        puts exception.to_s
        false
      else
        if page.code.to_i == 200
          cj = page.mech.agent.cookie_jar.store
          index = cj.count
          for i in 0...index
            index = i if cj.to_a[i].domain == 'opportunities.aiesec.org'
            puts i
          end
          if index != cj.count
            token = cj.to_a[index].value
            expiration_time = cj.to_a[index].created_at
            max_age = cj.to_a[index].max_age
            puts 'token: '+token.to_s
            puts 'expiration_time: '+expiration_time.to_s
            puts 'max_age: '+max_age.to_s
          end
        end
      end
      {token:token,expiration_time:expiration_time,max_age:max_age}
    end

    def get_updated_token
      nil if @email.nil? || @password.nil?

      time = (self.get_expiration_time + (self.get_max_age/2))

      if (Time.now < time)
        self.get_token
      else
        auth(@email, @password)
        self.get_token
      end
    end

    def get_token
      @token
    end

    def get_expiration_time
      @expiration_time = Time.now + 60 if @expiration_time.nil?
      @expiration_time
    end

    def get_max_age
      @max_age = 1800 if @max_age.nil?
      @max_age
    end

    def get_email
      @email
    end
  end
end
