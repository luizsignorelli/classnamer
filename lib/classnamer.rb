require 'classnamer/version'

# This module randomly generates class names, such as
# "PrioritizedUploadWrapper". It does this by concatenating several parts
# ("Prioritized", "Upload", and "Wrapper", in this case), which are strings
# randomly selected from arrays of candidates. ("Prioritized", "Upload", and
# "Wrapper" were each selected from a different array.) An array of such arrays
# is called a part candidate matrix.
module Classnamer

  # The default part candidate matrix, used by generate.
  PART_CANDIDATE_MATRIX = [
    %w{Threadsafe Optimized Stable Automatic Abstract Serializable Writable
       Readable Executable Nonblocking Scriptable Smart Basic Checked
       ErrorCorrecting Simple Secure Cryptographic Flexible Configurable
       Internal Cloneable Legacy Recursive Multiple Threaded Virtual Singleton
       Stateless Stateful Localized Prioritized Generic Dynamic Shared Runnable
       Modal},
    %w{Byte Task Object Resource Mutex Memory List Node File Lock Pixel
       Character Command Client Server Socket Thread Notification Keystroke
       Timestamp Raster String Hash Integer Cache Scrollbar Grid Jar Connection
       Database Graph Row Column Record Metadata Transaction Message Request
       Response Query Statement Result Upload Download User Directory Button
       Device Search Lolcat Girlfriend Yakizakana Flugzeug},
    %w{Sorter Allocator Tokenizer Writer Reader Randomizer Initializer Factory
       FactoryFactory Panel Frame Container Compressor Expander Counter
       Collector Collection Wrapper Accumulator Table Marshaller Demarshaller
       Extractor Parser Scanner Interpreter Validator Window Dialog Stream
       Listener Event Exception Vector Lexer Analyzer Iterator Set Tree
       Concatenator Monitor Tester Buffer Selector Visitor Adapter Helper
       Annotation Permission Info Action Channel Filter Manager Mediator
       Operation Context Queue Stack View Engine Publisher Subscriber Delegator
       State Processor Handler Generator Dispatcher Bundle Builder Logger
       Iterator Observer Encoder Decoder Importer Exporter Util Policy
       Preference Formatter Sequence Comparator Definition Timer Servlet
       Controller Loader Converter Constraint Module Migrator Descriptor}
  ]

  # The default index generator, used by generate.
  PRNG = ::Kernel.method(:rand)

  # This method does the actual work of randomly generating a class name. It
  # takes two arguments, both optional: a part candidate matrix (+matrix+) and
  # an index generator (+prng+). If +matrix+ is not specified, the module's
  # default part candidate matrix (PART_CANDIDATE_MATRIX) is used. If +prng+ is
  # not specified, Kernel::rand is used. +matrix+ must act like an array of
  # arrays of strings. +prng+ must have a "call" method that takes one integer
  # argument (an array length) and acts like Kernel::rand.
  def self.generate(matrix = self::PART_CANDIDATE_MATRIX, prng = self::PRNG)
    matrix.map { |a| a[prng.call a.length] }.join ''
  end

  # A class name generator that always uses the specified part candidate matrix
  # and index generator.
  class Generator
    # Creates a class name generator with the specified part candidate matrix
    # and index generator.
    def initialize(matrix = Classnamer::PART_CANDIDATE_MATRIX,
      prng = Classnamer::PRNG)
      @matrix = matrix
      @prng = prng
    end

    # Generates a class name using the part candidate matrix and index
    # generator passed in when the object was created.
    def generate
      Classnamer.generate @matrix, @prng
    end
  end
end
