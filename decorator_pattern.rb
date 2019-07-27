class Foo
  def foo
    puts "foo in Foo"
  end
end


module Bar
  def foo
    puts "foo in Bar"
    super
  end
end


foo = Foo.new
foo.foo #=>  foo in Foo
foo.extend(Bar)
foo.foo # => foo in Bar
        # => foo in Foo


# So basically the capabilities of foo method in Foo are extended without actually
# having to change foo in Foo. This is called decorator pattern
