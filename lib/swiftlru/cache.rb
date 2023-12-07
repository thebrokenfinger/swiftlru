# frozen_string_literal: true

module SwiftLRU
  # A tiny, fast LRU cache
  class Cache
    attr_reader :max_size, :size

    # Initializes a new Cache object with the specified maximum size.
    #
    # @param max_size [Integer] The maximum size of the cache. Must be an integer greater than 0.
    # @raise [ArgumentError] if max_size is not an integer greater than 0.
    def initialize(max_size)
      raise ArgumentError, 'max_size must be an integer greater than 0' if !max_size.is_a?(Integer) || max_size < 1

      @size = 0
      @max_size = max_size
      @cache = {}
      @old_cache = {}
    end

    # Checks if the cache contains the specified key.
    #
    # @param key [Object] The key to check.
    # @return [Boolean] true if the cache contains the key, false otherwise.
    def has(key)
      @cache.key?(key) || @old_cache.key?(key)
    end

    # Removes the specified key from the cache.
    #
    # @param key [Object] The key to remove.
    # @return [void]
    def remove(key)
      if @cache.key?(key)
        @cache.delete(key)
        @size -= 1
      end

      return unless @old_cache.key?(key)

      @old_cache.delete(key)
    end

    # Retrieves the value associated with the specified key from the cache.
    #
    # @param key [Object] The key to retrieve the value for.
    # @return [Object, nil] The value associated with the key, or nil if the key is not found.
    def get(key)
      return @cache[key] if @cache.key?(key)

      if @old_cache.key?(key)
        value = @old_cache[key]
        update(key, value)
        return value
      end

      nil
    end

    # Sets the value associated with the specified key in the cache.
    #
    # @param key [Object] The key to set the value for.
    # @param value [Object] The value to set.
    # @return [void]
    def set(key, value)
      if @cache.key?(key)
        @cache[key] = value
        @size += 1
      else
        update(key, value)
      end
    end

    # Clears the cache, removing all keys and values.
    #
    # @return [void]
    def clear
      @cache = {}
      @old_cache = {}
      @size = 0
    end

    private

    def update(key, value)
      @cache[key] = value
      @size += 1

      return unless @size >= @max_size

      @old_cache = @cache
      @cache = {}
      @size = 0
    end
  end
end
