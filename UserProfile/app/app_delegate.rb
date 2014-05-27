class AppDelegate
  def application(application, didFinishLaunchingWithOptions: launchOptions)
    puts "#{App.name} (#{App.documents_path})"
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    @user = User.load
    @user ||= User.new(id: "123", name: "Clay", email: "clay@mail.com", phone: "555-555-5555")
    @user_controller = UserController.alloc.initWithUser(@user)
    @nav_controller = UINavigationController.alloc.initWithRootViewController(@user_controller)
    @window.rootViewController = @nav_controller
    @window.makeKeyAndVisible

    true
  end

  def applicationDidEnterBackground(application)
    @user.save
  end
end
