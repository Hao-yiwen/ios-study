# PodHelpers.rb

def min_supported_versions
    { :ios => '13.0' }
  end

def get_folly_config()
    return {
      :version => '2024.01.01.00',
      :compiler_flags => '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -DFOLLY_CFG_NO_COROUTINES=1 -DFOLLY_HAVE_CLOCK_GETTIME=1 -Wno-comma -Wno-shorten-64-to-32'
  }
  end