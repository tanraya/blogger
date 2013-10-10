if Rails.env.development?
  # Clear database
  Rake::Task["db:reset"].invoke
end

lorem_html = "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur a lectus rutrum, faucibus arcu eu, congue libero. Donec lectus massa, pretium ut nisi quis, mollis suscipit ante. Donec non iaculis ligula. Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam aliquet nibh a orci pellentesque, a gravida turpis iaculis. Sed eget varius magna. Proin tempor lacinia diam mollis posuere. Ut vestibulum mauris sed eros pharetra, nec sollicitudin quam malesuada. Praesent elementum justo enim, eu ullamcorper lacus commodo non. Ut nulla tellus, convallis et dui vitae, tristique rutrum velit. In facilisis eget nisl vel vulputate. Suspendisse ultricies sem mi, at vulputate magna aliquam et. Nunc id molestie ipsum, vitae ornare tortor. Praesent vel mauris a magna pharetra tincidunt in ornare dui. Phasellus enim neque, porta ac leo at, lacinia ornare urna.</p><p>Mauris lobortis tellus turpis, non varius lorem volutpat vel. Praesent sed blandit nibh, ut vulputate quam. Nam nec orci auctor, tempus nibh vel, elementum urna. Nam sapien nibh, tristique eget lectus eget, egestas venenatis quam. Praesent vitae suscipit lorem, bibendum viverra diam. In velit sapien, pharetra eget libero et, mollis tincidunt erat. Duis eu mauris bibendum, sodales neque vitae, fermentum nisi. Mauris tincidunt facilisis leo viverra sagittis. Mauris sed consequat tortor. Suspendisse potenti. Vestibulum in volutpat arcu. Quisque at tincidunt diam.</p>"

john_doe = User.create!(
  name: 'John Doe',
  email: 'johndoe@example.com',
  password: 'secret12345',
  password_confirmation: 'secret12345',
)

mary_ann = User.create!(
  name: 'Mary Ann Hobbs',
  email: 'maryann@example.com',
  password: 'secret12345',
  password_confirmation: 'secret12345',
)

john_doe.posts.create!(title: 'Once upon a time in America', article: lorem_html, image_to_download: 'http://www.mrwallpaper.com/wallpapers/Cat-Sad-Annoyed.jpg')
john_doe.posts.create!(title: 'When I was young', article: lorem_html, image_to_download: 'http://upload.wikimedia.org/wikipedia/commons/4/4d/Cat_March_2010-1.jpg')
john_doe.posts.create!(title: 'How to prepare a cat', article: lorem_html, image_to_download: 'http://www.hdwallpapers.in/walls/cat_eyes-HD.jpg')

mary_ann.posts.create!(title: 'Artists in UK', article: lorem_html, image_to_download: 'http://www.oscci.com/wp-content/uploads/2013/02/pretty-cat.jpg')
mary_ann.posts.create!(title: 'Represents my new album', article: lorem_html, image_to_download: 'http://files.myopera.com/x-trance/albums/5290012/264976-1920x1200.jpg')
