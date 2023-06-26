require 'ezcapture'

#===============================================================================
# BrytonTest
#
class EzCaptureTest < Minitest::Test
  # go_dir
  def go_dir(level=0)
    dir = File.dirname(caller_locations[level].path)
    
    Dir.chdir(dir) do
      yield
    end
  end
end
#
# BrytonTest
#===============================================================================