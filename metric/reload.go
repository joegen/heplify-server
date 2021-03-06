package metric

import (
	"io/ioutil"
	"strings"
	"unicode"

	"github.com/negbie/logp"

	"github.com/negbie/heplify-server/config"
)

func cutSpace(str string) string {
	return strings.Map(func(r rune) rune {
		if unicode.IsSpace(r) {
			return -1
		}
		return r
	}, str)
}

func normMax(val float64) float64 {
	if val > 10000000 {
		return 0
	}
	return val
}

func (p *Prometheus) loadPromConf() {
	var fsTargetIP []string
	var fsTargetName []string

	fb, err := ioutil.ReadFile(config.Setting.Config)
	if err != nil {
		logp.Err("%v", err)
		return
	}

	fs := cutSpace(string(fb))

	if si := strings.Index(fs, "PromTargetIP=\""); si > -1 {
		s := si + len("PromTargetIP=\"")
		e := strings.Index(fs[s:], "\"")
		if e >= 7 {
			fsTargetIP = strings.Split(fs[s:s+e], ",")
		}
	}
	if si := strings.Index(fs, "PromTargetName=\""); si > -1 {
		s := si + len("PromTargetName=\"")
		e := strings.Index(fs[s:], "\"")
		if e > 0 {
			fsTargetName = strings.Split(fs[s:s+e], ",")
		}
	}

	if fsTargetIP != nil && fsTargetName != nil && len(fsTargetIP) == len(fsTargetName) {
		p.TargetConf.Lock()
		p.TargetIP = fsTargetIP
		p.TargetName = fsTargetName
		p.TargetEmpty = false
		p.TargetConf.Unlock()
		logp.Info("successfully reloaded PromTargetIP: %#v", fsTargetIP)
		logp.Info("successfully reloaded PromTargetName: %#v", fsTargetName)
	} else {
		logp.Info("failed to reload PromTargetIP: %#v", fsTargetIP)
		logp.Info("failed to reload PromTargetName: %#v", fsTargetName)
		logp.Info("please give every PromTargetIP a unique IP and PromTargetName a unique name")
	}
}
