require "classnamer/version"

module Classnamer
  PART_CANDIDATE_MATRIX = [
    %w{Threadsafe Optimized Stable Automatic Abstract Serializable Writable
       Readable Executable Nonblocking Scriptable Smart Basic Checked
       ErrorCorrecting Simple Secure Cryptographic Flexible Configurable
       Internal Property Cloneable Legacy Recursive Multiple Threaded Virtual
       Singleton Stateless Stateful Localized Prioritized Generic Dynamic
       Shared Runnable Modal},
    %w{Byte Task Object Resource Mutex Memory List Node File Lock Pixel
       Character Command Client Server Socket Thread Notification Keystroke
       Timestamp Raster String Hash Integer Cache Scrollbar Grid Jar Connection
       Database Graph Row Column Record Metadata Transaction Message Request
       Response Query Statement Result Upload Download User Directory Button
       Lolcat Girlfriend Yakizakana Flugzeug},
    %w{Sorter Allocator Tokenizer Writer Reader Randomizer Initializer Factory
       FactoryFactory Panel Frame Container Compressor Expander Counter
       Collector Collection Wrapper Accumulator Table Marshaller Demarshaller
       Extractor Parser Scanner Interpreter Validator Window Dialog Stream
       Listener Event Exception Vector Lexer Analyzer Iterator Set Tree
       Concatenator Monitor Tester Buffer Selector Visitor Adapter Helper
       Annotation Permission Info Action Impl Channel Filter Manager Mediator
       Operation Context Queue Stack View Engine Publisher Subscriber Delegator
       State Processor Handler Generator Dispatcher Bundle Builder Logger
       Iterator Observer Encoder Decoder Importer Exporter Util Policy
       Preference Formatter Sequence Comparator Definition Timer Servlet
       Controller Loader Converter Constraint Module Migrator}
  ]

  def self.generate(matrix = self::PART_CANDIDATE_MATRIX)
    # Ruby 1.9 has Array#sample and Ruby 1.8 has Array#choice. I want this to
    # run on both, so I'll get a random element manually. That seems better
    # than calling a different method depending on the interpreter's version
    # number.
    matrix.map{|a| a[rand a.length]}.join("")
  end
end
