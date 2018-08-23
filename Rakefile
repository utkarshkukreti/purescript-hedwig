task :g do
  def modify(path, &block)
    warning = "--- DO NOT EDIT BELOW ---"
    header = File.read(path).lines.take_while { |line| line.chomp != warning }.join
    File.open(path, "wb") do |f|
      f << header
      f << warning + "\n"
      block.call(f)
    end
  end

  elements = %w(
    a abbr address article aside audio b bdi bdo blockquote br button canvas
    caption cite code col colgroup datalist dd del details dfn div dl dt em
    embed fieldset figcaption figure footer form h1 h2 h3 h4 h5 h6 header hr
    i iframe img input ins kbd label legend li main map mark math menu
    menuitem meter nav node object ol optgroup option output p param pre
    progress q rp rt ruby s samp section select small source span strong sub
    summary sup table tbody td textarea tfoot th thead time tr track u
    ul var video wbr
  ).sort

  modify("src/Hedwig/Element.purs") do |f|
    elements.each do |name|
      f << "
#{name} :: forall msg. Element msg
#{name} = element #{name.inspect}
"
    end
  end

  properties = ["classList", "style", "styles"]

  modify("src/Hedwig/Property.purs") do |f|
    %w(autocomplete autofocus autoplay checked contentEditable controls
    default disabled hidden isMap loop multiple noValidate readOnly required
    reversed selected spellcheck).sort.each do |name|
      properties << name
      f << "
#{name} :: forall msg. Boolean -> Trait msg
#{name} = property #{name.inspect}
"
    end

    %w(accept acceptCharset action align alt class':className coords dir
    download downloadAs dropzone enctype for:htmlFor headers href hreflang id
    kind lang max method min name pattern ping placeholder poster preload
    sandbox scope shape src srcdoc srclang step target title type':type
    useMap value wrap accessKey).sort.each do |name|
      name, string = name.include?(":") ? name.split(":") : [name, name]
      properties << name
      f << "
#{name} :: forall msg. String -> Trait msg
#{name} = property #{string.inspect}
"
    end

    %w(tabindex height width minlength maxlength size cols rows colspan rowspan
    start).sort.each do |name|
      properties << name
      f << "
#{name} :: forall msg. Int -> Trait msg
#{name} = attribute #{name.inspect} <<< show
"
    end

    %w(contextmenu draggable itemprop list media rel datetime pubdate manifest
    ).sort.each do |name|
      properties << name
      f << "
#{name} :: forall msg. String -> Trait msg
#{name} = attribute #{name.inspect}
"
    end
  end

  modify("src/Hedwig.purs") do |f|
    f << "\nimport Hedwig.Element (\n"
    f << elements.sort.map { |element| "  #{element}" }.join(",\n")
    f << "\n) as Exports\n"

    f << "\nimport Hedwig.Property (\n"
    f << properties.sort.map { |property| "  #{property}" }.join(",\n")
    f << "\n) as Exports\n"

    f << "
infixr 6 Tuple as :>

sync :: forall a. Effect a -> Aff a
sync = liftEffect
"
  end
end
