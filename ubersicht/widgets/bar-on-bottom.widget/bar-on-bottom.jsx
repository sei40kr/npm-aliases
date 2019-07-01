export const command = './bar-on-bottom.widget/libexec/chunkwm-status';

export const refreshFrequency = 500; // ms

const renderDesktop = ({ desktopId, isActive }) => {
  let desktopName;

  switch (desktopId) {
    case '1':
      desktopName = 'Web';
      break;
    case '2':
      desktopName = 'File';
      break;
    case '3':
      desktopName = 'Development';
      break;
    case '4':
      desktopName = 'Design';
      break;

    default:
      desktopName = `Desktop ${desktopId}`;
  }

  return (
    <span className={`desktop ${isActive ? 'desktop--active' : ''}`}>
      {desktopName}
    </span>
  );
};

const renderDesktops = (activeDesktopId, desktopIds) => (
  <div className="desktops">
    {desktopIds.map((desktopId) =>
      renderDesktop({ desktopId, isActive: desktopId === activeDesktopId })
    )}
  </div>
);

export const render = ({ output }) => {
  if (!output) {
    return null;
  }

  const lines = output.split(/\r\n|\r|\n/);

  const desktopIds = lines[0].split(/\s+/);
  const activeDesktopId = lines[1];

  return renderDesktops(activeDesktopId, desktopIds);
};

export const className = `
align-items: center;
backdrop-filter: blur(20px);
bottom: 0;
box-sizing: border-box;
color: #fff;
display: flex;
font-family: 'SF Display', sans-serif;
font-size: 15px;
-webkit-font-smoothing: antialiased;
height: calc(64px + 48px);
justify-content: center;
left: 0;
padding: 0 0 64px;
position: absolute;
right: 0;
width: 100%;

.desktops {
  display: flex;
  margin: 2px 0 0;
}

.desktop {
  border-radius: 4px;
  display: block;
  height: 1.5em;
  line-height: 1.5em;
  padding: 0 .8em;

  &:not(:last-child) {
    margin-right: .8em;
  }

  &--active {
    background: rgba(255, 255, 255, .1);
  }
}
`;
