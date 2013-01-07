$ok_test = 0
$ko_test = 0
$kill_test = 0
$asserts  = []

##
# Create the assertion in a readable way
def assertion_string(err, str, e=nil)
  msg = "#{err}#{str}"
  msg += " => #{e.message}" if e
  msg
end

##
# Verify a code block.
#
# str : A remark which will be printed in case
#       this assertion fails
def assert(str = 'Assertion failed')
  begin
    if(!yield)
      $asserts.push(assertion_string("#{GEMNAME} Fail: ", str))
      $ko_test += 1
      print('F')
    else
      $ok_test += 1
      print('.')
    end
  rescue Exception => e
    $asserts.push(assertion_string("#{GEMNAME} Error: ", str, e))
    $kill_test += 1
    print('X')
  end
end
