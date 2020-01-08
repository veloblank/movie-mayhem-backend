require 'open-uri'
rt = "https://www.imdb.com/movies-in-theaters/?ref_=nv_mv_inth"
doc = Nokogiri::HTML.parse(open(rt))

# In Theatres:
movies = doc.css('.list.detail.sub-list')[1]
divs = movies.css('div.outline')

titles = movies.css('h4').map{|title| title.text.strip.gsub(/ \(2019\)| \(2020\)/,'')}
poster_sources = movies.css('img.poster.shadowed').map{|poster| poster.attributes['src'].value}
metascores = movies.css('.metascore').map{|score| score.text.slice(0,5).strip.to_i}
synopses = divs.slice(0, divs.length - 1)
trimmed_synopses = synopses.map{|synopsis| synopsis.text.strip}

Movie.create(title: titles[0], poster_src: poster_sources[0], rating: metascores[0], synopsis: trimmed_synopses[0])
Movie.create(title: titles[1], poster_src: poster_sources[1], rating: metascores[1], synopsis: trimmed_synopses[1])
Movie.create(title: titles[2], poster_src: poster_sources[2], rating: metascores[2], synopsis: trimmed_synopses[2])
Movie.create(title: titles[3], poster_src: poster_sources[3], rating: metascores[3], synopsis: trimmed_synopses[3])
Movie.create(title: titles[4], poster_src: poster_sources[4], rating: metascores[4], synopsis: trimmed_synopses[4])
Movie.create(title: titles[5], poster_src: poster_sources[5], rating: metascores[5], synopsis: trimmed_synopses[5])
Movie.create(title: titles[6], poster_src: poster_sources[6], rating: metascores[6], synopsis: trimmed_synopses[6])
Movie.create(title: titles[7], poster_src: poster_sources[7], rating: metascores[7], synopsis: trimmed_synopses[7])
Movie.create(title: titles[8], poster_src: poster_sources[8], rating: metascores[8], synopsis: trimmed_synopses[8])
Movie.create(title: titles[9], poster_src: poster_sources[9], rating: metascores[9], synopsis: trimmed_synopses[9])


