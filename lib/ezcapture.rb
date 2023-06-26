require 'open3'

class EzCapture
  # version
  VERSION = '1.0'
  
  # The command sent to Open3.capture
  # @!attribute [r] cmd
  # @return [Array] individual strings in the command
  attr_reader :cmd
  
  # Array returned by Open3.capture
  # @return [Array]
  attr_reader :results
  
  # Error object if command failed
  # @return [Errno::ENOENT]
  attr_reader :error
  
  # @param p_cmd [Array] one or more strings to send as a command
  def initialize(*p_cmd)
      super()
      @results = nil
      @error = nil
      
      # flatten command
      @cmd = p_cmd.flatten.clone
      
      # attempt to run command
      begin
          @results = Open3.capture3(*cmd)
      
      # catch errors
      rescue => e
          @error = e
      end
  end
  
  # @return [String] STDOUT from the command
  def stdout
      if @results
          return @results[0]
      else
          return nil
      end
  end
  
  # @return [String] STDERR from the command
  def stderr
      if @results
          return @results[1]
      else
          return nil
      end
  end
  
  # @return [Process::Status] status of running the command
  def status
      if @results
          return @results[2]
      else
          return nil
      end
  end
  
  # @return [Boolean] success or failure of the command
  def success?
      if status
          return @results[2].success?
      else
          return false
      end
  end
end