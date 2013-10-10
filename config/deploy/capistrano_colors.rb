require 'capistrano_colors'

capistrano_color_matchers = [
  { :match => /command finished/,       :color => :hide,    :prio => 10 },
  { :match => /executing command/,      :color => :blue,    :prio => 10, :attribute => :underscore },
  { :match => /^transaction: commit$/,  :color => :magenta, :prio => 10, :attribute => :blink },
  { :match => /git/,                    :color => :white,   :prio => 20, :attribute => :reverse },
  { :match => /failed:/,                :color => :red,     :prio => 30, :attribute => :reverse },
]

colorize( capistrano_color_matchers )