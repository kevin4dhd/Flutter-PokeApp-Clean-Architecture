String getIconByType(String type) {
  switch (type) {
    case 'fire':
      return 'G';
    case 'grass':
      return 'J';
    case 'water':
      return 'R';
    case 'rock':
      return 'P';
    case 'bug':
      return 'A';
    case 'normal':
      return 'M';
    case 'poison':
      return 'N';
    case 'electric':
      return 'D';
    case 'ground':
      return 'K';
    case 'ice':
      return 'L';
    case 'dark':
      return 'B';
    case 'fairy':
      return 'E';
    case 'psychic':
      return 'O';
    case 'fighting':
      return 'F';
    case 'ghost':
      return 'I';
    case 'flying':
      return 'H';
    case 'dragon':
      return 'C';
    case 'steel':
      return 'Q';
    default:
      return 'A';
  }
}

String getColorFromType(String type) {
  const colours = {
    'normal': '#A8A77A',
    'fire': '#EE8130',
    'water': '#6390F0',
    'electric': '#F7D02C',
    'grass': '#7AC74C',
    'ice': '#96D9D6',
    'fighting': '#C22E28',
    'poison': '#A33EA1',
    'ground': '#E2BF65',
    'flying': '#A98FF3',
    'psychic': '#F95587',
    'bug': '#A6B91A',
    'rock': '#B6A136',
    'ghost': '#735797',
    'dragon': '#6F35FC',
    'dark': '#705746',
    'steel': '#B7B7CE',
    'fairy': '#D685AD',
  };
  return colours[type] ?? '#777777';
}
