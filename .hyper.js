module.exports = {
    config: {
        fontSize: 12,
        fontFamily: 'FiraCode-Retina, Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
        cursorColor: 'rgba(68, 243, 240, 0.7)',
        cursorShape: 'UNDERLINE',
        cursorBlink: false,
        foregroundColor: '#fff',
        backgroundColor: 'rgb(58, 61, 69)',
        termCSS: `
            x-screen x-row {
                font-variant-ligatures: initial; /* enable ligatures */
            }
        `,
        padding: '8px 10px',
        shell: '/bin/zsh',
        shellArgs: ['--login'],
        env: {},
        bell: false,
        copyOnSelect: true,

        hyperBorder: {
            borderColors: ['#fc1da7', '#fba506'],
            borderWidth: '2px'
        },

    },

    plugins: [
        'hypercwd',
        'hyperlinks',
        'hyperterm-safepaste',
        'hyperborder',

        'hyper-atom-dark-transparent',
    ]
};
