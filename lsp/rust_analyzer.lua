return {
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        features = "all"
      },
      imports = {
        preferPrelude = true
      }
    },
  },
}
