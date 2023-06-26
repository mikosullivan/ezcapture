require 'helper'

class EzCaptureTest::Basic < EzCaptureTest
  # basic functionality
  def test_basic
    go_dir() do
      cmd = ['/usr/bin/ls', '--human-readable']
      cap = EzCapture.new(*cmd)
      assert_instance_of EzCapture, cap
      assert cap.success?
      assert cap.stdout.match(/tests\.rb/mu)
      assert cap.stderr.empty?
      assert_instance_of Process::Status, cap.status
      assert cap.status.exited?
    end
  end
  
  # command with invalid option
  def test_invalid_option
    bogus = ['/usr/bin/ls', '--sfdgfds']
    cap = EzCapture.new(*bogus)
    refute cap.success?
    assert cap.stderr.match(/unrecognized\s+option/mu)
    assert cap.stdout.empty?
  end
  
  # non-existent executable
  def test_non_existent_executable
    bogus = ['/usr/bin/sfddsaf', '--whatever']
    cap = EzCapture.new(*bogus)
    refute cap.success?
    assert cap.stdout.nil?
    assert cap.stderr.nil?
    assert cap.status.nil?
  end
  
  # non-execiutable file
  def test_non_execiutable_file
    go_dir() do
      bogus = ['./not-executable.txt']
      cap = EzCapture.new(*bogus)
      refute cap.success?
      assert_instance_of Errno::EACCES, cap.error
    end
  end
end

__END__

puts '---------------------------------------------------------------'
puts cap.success?
puts '---------------------------------------------------------------'