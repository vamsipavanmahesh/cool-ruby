class Report
  def self.data(formatter)
    data = "foobar" # assume that we got it after querying DB
    formatter.format("foobar")
  end
end

# Now I have a class called Report, which has data as a class method
# Now I would like to get the report in the json and html format
# without actually wanting to hard code the formatter information in the Report class



class JsonFormatter
  def self.format(data)
    { 'foo' => data }
  end
end

class HtmlFormatter
  def self.format(data)
    <h1> data </h1>
  end
end



# Let's say controller gets a request for data to be presnt in json format
# we find the format and see if we have a format
# 

class ReportsController

  FORMATTERS = {
    'json' => JsonFormatter
    'html' => HtmlFormatter
  }

  def show
    Report.data(formatter)
  end

  private

  def formatter
    FORMATTERS.fetch(params['format'])
  end 
end
